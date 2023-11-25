using AutoMapper;
using Core.Mediators.Relationships.Commands.DeleteRelationship;
using Core.Mediators.Relationships.Commands.UpdateRelationship;
using Core.Mediators.Relationships.Queries.GetRelationships;
using Core.Responses.Relationships;
using Mediators.Relationships.Commands.CreateRelationship;
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
    public class RelationshipController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly ISender _sender;

        public RelationshipController(
            IMapper mapper,
            ISender sender)
        {
            _mapper = mapper;
            _sender = sender;
        }

        /// <summary>
        /// Gets all of the relationships.
        /// </summary>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>The collection of relationships.</returns>
        [HttpGet("")]
        [ProducesResponseType(typeof(List<RelationshipResponse>), StatusCodes.Status200OK)]
        public async Task<IActionResult> GetRelationships(CancellationToken cancellationToken)
        {
            var query = new GetRelationshipsQuery();

            var relationships = await _sender.Send(query, cancellationToken);

            return Ok(relationships);
        }

        /// <summary>
        /// Creates a new relationship based on the specified request.
        /// </summary>
        /// <param name="request">The create relationship request.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>The newly created relationship.</returns>
        [HttpPost("")]
        [ProducesResponseType(typeof(RelationshipResponse), StatusCodes.Status201Created)]
        public async Task<IActionResult> CreateRelationship([FromBody] CreateRelationshipRequest request, CancellationToken cancellationToken)
        {
            request.SetUserId(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var command = _mapper.Map<CreateRelationshipCommand>(request);

            var relationship = await _sender.Send(command, cancellationToken);

            return Ok(relationship);
        }

        /// <summary>
        /// Updates the relationship with the specified identifier based on the specified request, if it exists.
        /// </summary>
        /// <param name="relationshipId">The relationship identifier.</param>
        /// <param name="request">The update relationship request.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>No content.</returns>
        [HttpPut("{relationshipId:int}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateRelationship([FromRoute] int relationshipId, [FromBody] UpdateRelationshipRequest request, CancellationToken cancellationToken)
        {
            request.SetUserId(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var command = _mapper.Map<UpdateRelationshipCommand>(request);
            command.Id = relationshipId;

            await _sender.Send(command, cancellationToken);

            return NoContent();
        }

        /// <summary>
        /// Deletes the relationship with the specified identifier based on the specified request, if it exists.
        /// </summary>
        /// <param name="relationshipId">The relationship identifier.</param>
        /// <param name="request">The delete relationship request.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>No content.</returns>
        [HttpDelete("{relationshipId:int}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteRelationship([FromRoute] int relationshipId, CancellationToken cancellationToken)
        {
            var request = new DeleteRelationshipRequest();
            request.SetUserId(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var command = _mapper.Map<DeleteRelationshipCommand>(request);
            command.Id = relationshipId;

            await _sender.Send(command, cancellationToken);

            return NoContent();
        }
    }
}
