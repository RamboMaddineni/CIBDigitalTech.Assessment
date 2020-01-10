using CIBDigitalTech.Assessment.Contracts;
using CIBDigitalTech.Assessment.Models;
using CIBDigitalTech.Assessment.Repository.Contracts;
using CIBDigitalTech.Assessment.Utilities;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CIBDigitalTech.Assessment.Services
{
    public class PhoneBookService: RepositoryBase, IPhoneBookService
    {
        public PhoneBookService(IDapperRepository dapperRepository, IConfiguration iConfig) : base(dapperRepository, iConfig)
        {

        }
       

        public async Task<int> AddNewContact(AddContactsModel model)
        {
            _dbconnection.StoredProcedure = Constants.AddContactStoredProcedure;
            _dbconnection.Parameters = model;
            return await _dapperRepository.Execute(_dbconnection);
        }

        public async Task<IList<GetContactsModel>> GetContacts()
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.GetContactsStoredProcedure;
                _dbconnection.Parameters = null;
                return await _dapperRepository.QueryList<GetContactsModel>(_dbconnection);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
