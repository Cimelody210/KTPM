using NUnit.Framework;
using YourHotelApp.Models;

namespace YourHotelApp.Tests
{
    [TestFixture]
    public class HotelManagerTests
    {
        [Test]
        public void AddRoom_ValidRoom_ReturnsTrue()
        {
            // Arrange
            var hotelManager = new HotelManager();
            var room = new Room { Number = "101", Type = RoomType.Standard, Rate = 100 };

            // Act
            var result = hotelManager.AddRoom(room, UserRole.Manager);

            // Assert
            Assert.IsTrue(result);
        }

        [Test]
        public void RemoveRoom_ManagerPermission_ReturnsTrue()
        {
            // Arrange
            var hotelManager = new HotelManager();
            var room = new Room { Number = "101", Type = RoomType.Standard, Rate = 100 };
            hotelManager.AddRoom(room, UserRole.Manager);

            // Act
            var result = hotelManager.RemoveRoom("101", UserRole.Manager);

            // Assert
            Assert.IsTrue(result);
        }

        [Test]
        public void RemoveRoom_EmployeePermission_ReturnsFalse()
        {
            // Arrange
            var hotelManager = new HotelManager();
            var room = new Room { Number = "101", Type = RoomType.Standard, Rate = 100 };
            hotelManager.AddRoom(room, UserRole.Manager);

            // Act
            var result = hotelManager.RemoveRoom("101", UserRole.Employee);

            // Assert
            Assert.IsFalse(result);
        }

        [Test]
        public void UpdateRoom_ManagerPermission_ReturnsTrue()
        {
            // Arrange
            var hotelManager = new HotelManager();
            var room = new Room { Number = "101", Type = RoomType.Standard, Rate = 100 };
            hotelManager.AddRoom(room, UserRole.Manager);
            var updatedRoom = new Room { Number = "101", Type = RoomType.Deluxe, Rate = 150 };

            // Act
            var result = hotelManager.UpdateRoom(updatedRoom, UserRole.Manager);

            // Assert
            Assert.IsTrue(result);
        }

        [Test]
        public void UpdateRoom_EmployeePermission_ReturnsFalse()
        {
            // Arrange
            var hotelManager = new HotelManager();
            var room = new Room { Number = "101", Type = RoomType.Standard, Rate = 100 };
            hotelManager.AddRoom(room, UserRole.Manager);
            var updatedRoom = new Room { Number = "101", Type = RoomType.Deluxe, Rate = 150 };

            // Act
            var result = hotelManager.UpdateRoom(updatedRoom, UserRole.Employee);

            // Assert
            Assert.IsFalse(result);
        }
    }
}
