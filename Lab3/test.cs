using NUnit.Framework;
using Moq;
using System.Web.Mvc;
using YourApplication.Controllers;
using YourApplication.Models;

namespace YourApplication.Tests.Controllers
{
    [TestFixture]
    public class AccountControllerTests
    {
        [Test]
        public void Login_ValidCredentials_RedirectsToHomePage()
        {
            // Arrange
            var mockAuthService = new Mock<IAuthenticationService>();
            mockAuthService.Setup(x => x.ValidateUser(It.IsAny<string>(), It.IsAny<string>())).Returns(true);
            var controller = new AccountController(mockAuthService.Object);

            // Act
            var result = controller.Login(new LoginViewModel { Username = "validUsername", Password = "validPassword" }) as RedirectToRouteResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Home", result.RouteValues["controller"]);
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }

        [Test]
        public void Login_InvalidCredentials_ReturnsLoginView()
        {
            // Arrange
            var mockAuthService = new Mock<IAuthenticationService>();
            mockAuthService.Setup(x => x.ValidateUser(It.IsAny<string>(), It.IsAny<string>())).Returns(false);
            var controller = new AccountController(mockAuthService.Object);

            // Act
            var result = controller.Login(new LoginViewModel { Username = "invalidUsername", Password = "invalidPassword" }) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("", result.ViewName); // Assuming the default view is used
            Assert.IsFalse(result.ViewData.ModelState.IsValid);
            Assert.IsTrue(result.ViewData.ModelState.ContainsKey("loginError"));
        }

        [Test]
        public void ForgotPassword_ValidEmail_RedirectsToConfirmationPage()
        {
            // Arrange
            var mockUserService = new Mock<IUserService>();
            mockUserService.Setup(x => x.ResetPassword(It.IsAny<string>())).Returns(true);
            var controller = new AccountController(mockUserService.Object);

            // Act
            var result = controller.ForgotPassword("validEmail") as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("ForgotPasswordConfirmation", result.ViewName);
        }

        [Test]
        public void ForgotPassword_InvalidEmail_ReturnsErrorView()
        {
            // Arrange
            var mockUserService = new Mock<IUserService>();
            mockUserService.Setup(x => x.ResetPassword(It.IsAny<string>())).Returns(false);
            var controller = new AccountController(mockUserService.Object);

            // Act
            var result = controller.ForgotPassword("invalidEmail") as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Error", result.ViewName);
        }

        [Test]
        public void Register_ValidModel_RedirectsToLoginPage()
        {
            // Arrange
            var mockUserService = new Mock<IUserService>();
            mockUserService.Setup(x => x.RegisterUser(It.IsAny<RegisterViewModel>())).Returns(true);
            var controller = new AccountController(mockUserService.Object);

            // Act
            var result = controller.Register(new RegisterViewModel { Username = "validUsername", Password = "validPassword" }) as RedirectToRouteResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Account", result.RouteValues["controller"]);
            Assert.AreEqual("Login", result.RouteValues["action"]);
        }

        [Test]
        public void Register_InvalidModel_ReturnsRegisterView()
        {
            // Arrange
            var mockUserService = new Mock<IUserService>();
            mockUserService.Setup(x => x.RegisterUser(It.IsAny<RegisterViewModel>())).Returns(false);
            var controller = new AccountController(mockUserService.Object);

            // Act
            var result = controller.Register(new RegisterViewModel { Username = "", Password = "" }) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("", result.ViewName); // Assuming the default view is used
            Assert.IsFalse(result.ViewData.ModelState.IsValid);
        }
    }
}
