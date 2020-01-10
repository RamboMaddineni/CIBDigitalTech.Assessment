using CIBDigitalTech.Assessment.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CIBDigitalTech.Assessment.Contracts
{
    public interface IPhoneBookService
    {
        Task<int> AddNewContact(AddContactsModel model);
        Task<IList<GetContactsModel>> GetContacts();
    }
}
