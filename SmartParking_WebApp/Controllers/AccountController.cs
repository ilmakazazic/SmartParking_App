using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SignInResult = Microsoft.AspNetCore.Identity.SignInResult;

namespace SmartParking_WebApp.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _singInManager;

        public AccountController(UserManager<IdentityUser> userManager, SignInManager<IdentityUser> singInManager)
        {
            _userManager = userManager;
            _singInManager = singInManager;
        }

        [HttpGet]
        public IActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string Username, string Password)
        {
            var user = await _userManager.FindByNameAsync(Username);
            if (user!=null)
            {
                var signInResult = await _singInManager.PasswordSignInAsync(Username, Password, false, false);

                if (signInResult.Succeeded)
                {
                    return Redirect("/Admin/Home/Index");
                }
              
            }
            TempData["error_poruka"] = "pogrešan username ili password";
            return View("Login");


        }

        [HttpPost]
        public async Task<IActionResult> Logut(string returnUrl = null)
        {
            await _singInManager.SignOutAsync();

            return RedirectToAction("Login", "Account");

        }

        [HttpGet]
        public IActionResult AccessDenied()
        {

            return View();
        }




    }
}
