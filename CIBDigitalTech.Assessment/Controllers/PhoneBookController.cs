using System.Collections.Generic;
using System.Threading.Tasks;
using CIBDigitalTech.Assessment.Contracts;
using CIBDigitalTech.Assessment.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CIBDigitalTech.Assessment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PhoneBookController : ControllerBase
    {
        private readonly IPhoneBookService _phoneBookService;

        public PhoneBookController(IPhoneBookService phoneBookService)
        {
            _phoneBookService = phoneBookService;
        }

        [HttpGet("[action]")]
        public async Task<IList<GetContactsModel>> GetContacts()
        {
            return await _phoneBookService.GetContacts();
        }

        [HttpPost("[action]")]
        public async Task<int> AddContact(AddContactsModel model)
        {
            return await _phoneBookService.AddNewContact(model);
        }
    }
}