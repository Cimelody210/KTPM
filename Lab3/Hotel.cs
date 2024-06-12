using System;
using System.IO;
using System.Collection.Generic;
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
            var room1 = new Room { Number = "101", Type = RoomType.Standard, Rate = 100 };
            var room2 = new Room { Number = "102", Type = RoomType.Standard, Rate = 50 };
            var room3 = new Room { Number = "103", Type = RoomType.Standard, Rate = 50 };
            var room4 = new Room { Number = "104", Type = RoomType.Standard, Rate = 50 };
            var room5 = new Room { Number = "105", Type = RoomType.Standard, Rate = 50 };
            var room6 = new Room { Number = "106", Type = RoomType.Standard, Rate = 50 };
            var room7 = new Room { Number = "107", Type = RoomType.Standard, Rate = 50 };
            var room8 = new Room { Number = "108", Type = RoomType.Standard, Rate = 50 };

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
            var room2 = new Room { Number = "102", Type = RoomType.Standard, Rate = 50 };
            var room3 = new Room { Number = "103", Type = RoomType.Standard, Rate = 50 };
            var room4 = new Room { Number = "104", Type = RoomType.Standard, Rate = 50 };
            var room5 = new Room { Number = "105", Type = RoomType.Standard, Rate = 50 };
            var room6 = new Room { Number = "106", Type = RoomType.Standard, Rate = 50 };
            var room7 = new Room { Number = "107", Type = RoomType.Standard, Rate = 50 };
            var room8 = new Room { Number = "108", Type = RoomType.Standard, Rate = 50 };
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
