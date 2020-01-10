using CIBDigitalTech.Assessment.Repository.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CIBDigitalTech.Assessment.Repository.Contracts
{
    public interface IDapperRepository
    {
        Task<T> QueryOne<T>(DbConnection connection) where T : new();
        Task<IList<T>> QueryList<T>(DbConnection connection) where T : new();
        Task<int> Execute(DbConnection connection);
    }
}
