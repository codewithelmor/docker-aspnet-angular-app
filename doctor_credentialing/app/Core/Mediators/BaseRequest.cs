namespace Core.Mediators
{
    public class BaseRequest
    {
        private string _userId = string.Empty;

        public void SetUserId(string userId)
        {
            _userId = userId;
        }

        public string GetUserId()
        {
            return _userId;
        }
    }
}
