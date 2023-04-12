namespace Backend.Models
{
    public class ServiceStatus
    {
        public int IdService { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
        public ServiceStatus(int idService, string name, string status)
        {
            IdService = idService;
            Name = name;
            Status = status;
        }
    }
}
