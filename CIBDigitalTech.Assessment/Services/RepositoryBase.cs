using CIBDigitalTech.Assessment.Repository.Contracts;
using CIBDigitalTech.Assessment.Repository.Models;
using Microsoft.Extensions.Configuration;

namespace CIBDigitalTech.Assessment.Services
{
    public class RepositoryBase
    {
        internal IDapperRepository _dapperRepository;
        internal DbConnection _dbconnection { get; set; } = new DbConnection();
        private IConfiguration config;

        public RepositoryBase(IDapperRepository dapperRepository, IConfiguration iConfig)
        {
            _dapperRepository = dapperRepository;
             config = iConfig;
            _dbconnection.ConnectionString = iConfig.GetSection("dbConnectionStraing").Value;
        }
    }
}
