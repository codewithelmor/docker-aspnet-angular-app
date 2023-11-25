using AutoMapper;
using Core.Mediators.Salutations.Commands.DeleteSalutation;
using Core.Mediators.Salutations.Commands.UpdateSalutation;
using Core.Mediators.Salutations.Queries.GetSalutations;
using Core.Responses.Salutations;
using Mediators.Salutations.Commands.CreateSalutation;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Web.Constants;

namespace Web.Controllers
{
    [Authorize(Role.Admin)]
    [EnableCors(ControllerPolicy.Cors)]
    [ApiController]
    [Route("api/[controller]")]
    public class SalutationController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly ISender _sender;

        public SalutationController(
            IMapper mapper,
            ISender sender)
        {
            _mapper = mapper;
            _sender = sender;
        }

        /// <summary>
        /// Gets all of the salutations.
        /// </summary>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>The collection of salutations.</returns>
        [HttpGet("")]
        [ProducesResponseType(typeof(List<SalutationResponse>), StatusCodes.Status200OK)]
        public async Task<IActionResult> GetSalutations(CancellationToken cancellationToken)
        {
            var query = new GetSalutationsQuery();

            var salutations = await _sender.Send(query, cancellationToken);

            return Ok(salutations);
        }

        /// <summary>
        /// Creates a new salutation based on the specified request.
        /// </summary>
        /// <param name="request">The create salutation request.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>The newly created salutation.</returns>
        [HttpPost("")]
        [ProducesResponseType(typeof(SalutationResponse), StatusCodes.Status201Created)]
        public async Task<IActionResult> CreateSalutation([FromBody] CreateSalutationRequest request, CancellationToken cancellationToken)
        {
            request.SetUserId(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var command = _mapper.Map<CreateSalutationCommand>(request);

            var salutation = await _sender.Send(command, cancellationToken);

            return Ok(salutation);
        }

        /// <summary>
        /// Updates the salutation with the specified identifier based on the specified request, if it exists.
        /// </summary>
        /// <param name="salutationId">The salutation identifier.</param>
        /// <param name="request">The update salutation request.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>No content.</returns>
        [HttpPut("{salutationId:int}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateSalutation([FromRoute] int salutationId, [FromBody] UpdateSalutationRequest request, CancellationToken cancellationToken)
        {
            request.SetUserId(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var command = _mapper.Map<UpdateSalutationCommand>(request);
            command.Id = salutationId;

            await _sender.Send(command, cancellationToken);

            return NoContent();
        }

        /// <summary>
        /// Deletes the salutation with the specified identifier based on the specified request, if it exists.
        /// </summary>
        /// <param name="salutationId">The salutation identifier.</param>
        /// <param name="request">The delete salutation request.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>No content.</returns>
        [HttpDelete("{salutationId:int}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteSalutation([FromRoute] int salutationId, CancellationToken cancellationToken)
        {
            var request = new DeleteSalutationRequest();
            request.SetUserId(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var command = _mapper.Map<DeleteSalutationCommand>(request);
            command.Id = salutationId;

            await _sender.Send(command, cancellationToken);

            return NoContent();
        }
    }
}
