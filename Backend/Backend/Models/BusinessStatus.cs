namespace Backend.Models
{
    public class BusinessStatus
    {
        public int IdBTG { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public List<ServiceStatus> ServiceStatuses { get; set; }
        public BusinessStatus(int idBTG, string name, string description, string status, List<ServiceStatus> serviceStatuses)
        {
            IdBTG = idBTG;
            Name = name;
            Description = description;
            Status = status;
            ServiceStatuses = serviceStatuses;
        }
    }
}
