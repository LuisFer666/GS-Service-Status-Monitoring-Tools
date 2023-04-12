using Backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Backend.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BusinessStatusController : Controller
    {
        private readonly ILogger<BusinessStatusController> _logger;
        private readonly IConfiguration _configuration;

        public BusinessStatusController(ILogger<BusinessStatusController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        [HttpGet]
        [Route("")]
        public ActionResult Get()
        {
            List<BusinessStatus> businessStatuses = new List<BusinessStatus>();

            var connectionString = _configuration.GetConnectionString("MyDB");
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("[dbo].[BusinessStatus]", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int IdBTG = reader.GetInt32("IdBTG");
                            string Name = reader.GetString("Name");
                            string Description = reader.GetString("Description");
                            string Status = reader.GetString("Status");
                            List<ServiceStatus> serviceStatuses = new List<ServiceStatus>();

                            try
                            {
                                using (SqlConnection connection2 = new SqlConnection(connectionString))
                                {
                                    connection2.Open();
                                    SqlCommand command2 = new SqlCommand("[dbo].[ServicesStatus]", connection2);
                                    command2.CommandType = CommandType.StoredProcedure;
                                    command2.Parameters.Add("@IdBTG", SqlDbType.Int).Value = IdBTG;

                                    using (SqlDataReader reader2 = command2.ExecuteReader())
                                    {
                                        while (reader2.Read())
                                        {
                                            int IdService = reader2.GetInt32("IdService");
                                            string NameService = reader2.GetString("Name");
                                            string StatusService = reader2.GetString("Status");

                                            var ServiceStatus = new ServiceStatus(IdService, NameService, StatusService);
                                            serviceStatuses.Add(ServiceStatus);
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                return StatusCode(500, ex.Message);
                            }

                            var businessStatus = new BusinessStatus(IdBTG, Name, Description, Status, serviceStatuses);
                            businessStatuses.Add(businessStatus);
                        }

                        return Ok(businessStatuses);
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
