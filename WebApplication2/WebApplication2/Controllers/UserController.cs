using WebApplication2.Entities; // NOTE : Assurez-vous que WebApplication2 est le bon namespace.
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net;
using System.Collections.Generic; // Ajouté pour List<T>
using System.Threading.Tasks;

namespace WebApplication2.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        // CORRECTION 1 : Le contexte correct est DemoContext
        private readonly DemoContext DBContext; 
        
        // CORRECTION 1 : Utilisation de DemoContext dans le constructeur
        public UserController(DemoContext DBContext) 
        {
            this.DBContext = DBContext;
        }

        // --- Opérations CRUD ---

        /// <summary>
        /// Récupère la liste de tous les utilisateurs (GET all users)
        /// </summary>
        [HttpGet("GetUsers")]
        // CORRECTION 2 : Le type de retour utilise List<User>
        public async Task<ActionResult<List<User>>> Get()
        {
            // CORRECTION 3 : Utilise DBContext.Users (l'ensemble généré pour la table 'user')
            var List = await DBContext.Users.ToListAsync(); 
            
            if (List.Count == 0)
            {
                return NotFound();
            }
            return List;
        }

        /// <summary>
        /// Récupère un utilisateur par son Id (GET by Id)
        /// </summary>
        /// <param name="Id">Id de l'utilisateur à retourner</param>
        [HttpGet("GetUserById/{Id}")] 
        // CORRECTION 2 : Le type de retour utilise User
        public async Task<ActionResult<User>> GetUserById(int Id)
        {
            // CORRECTION 2 : Le type de variable utilise User
            User User = await DBContext.Users.FirstOrDefaultAsync(s => s.Id == Id);
            
            if (User == null)
            {
                return NotFound();
            }
            return User;
        }

        /// <summary>
        /// Insère un nouvel utilisateur (POST)
        /// </summary>
        // CORRECTION 2 : L'argument de la méthode utilise User
        [HttpPost("InsertUser")]
        public async Task<HttpStatusCode> InsertUser(User User)
        {
            // CORRECTION 3 : Utilise DBContext.Users
            DBContext.Users.Add(User);
            await DBContext.SaveChangesAsync();
            return HttpStatusCode.Created;
        }

        /// <summary>
        /// Met à jour un utilisateur existant (PUT)
        /// </summary>
        // CORRECTION 2 : L'argument de la méthode utilise User
        [HttpPut("UpdateUser")]
        public async Task<HttpStatusCode> UpdateUser(User User)
        {
            // CORRECTION 3 : Utilise DBContext.Users
            var entity = await DBContext.Users.FirstOrDefaultAsync(s => s.Id == User.Id);
            if (entity == null)
            {
                return HttpStatusCode.NotFound;
            }
            
            // Mise à jour des propriétés
            entity.FirstName = User.FirstName;
            entity.LastName = User.LastName;
            entity.Username = User.Username;
            entity.Password = User.Password;
            entity.EnrollmentDate = User.EnrollmentDate;
            
            await DBContext.SaveChangesAsync();
            return HttpStatusCode.OK;
        }

        /// <summary>
        /// Supprime un utilisateur par son Id (DELETE)
        /// </summary>
        /// <param name="Id">Id de l'utilisateur à supprimer</param>
        [HttpDelete("DeleteUser/{Id}")]
        public async Task<HttpStatusCode> DeleteUser(int Id)
        {
            // CORRECTION 2 : Le type de variable utilise User
            var entity = new User() { Id = Id };
            // CORRECTION 3 : Utilise DBContext.Users
            DBContext.Users.Attach(entity);
            DBContext.Users.Remove(entity);
            await DBContext.SaveChangesAsync();
            return HttpStatusCode.OK;
        }
    }
}