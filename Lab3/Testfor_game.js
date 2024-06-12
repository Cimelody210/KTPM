using UnityEngine;
using NUnit.Framework;

public class PlayerTests
{
    private Player player;

    [SetUp]
    public void Setup()
    {
        // Khởi tạo player trước mỗi kiểm thử
        player = new Player();
    }

    [Test]
    public void Player_StartsWithFullHealth()
    {
        Assert.AreEqual(100, player.Health);
    }

    [Test]
    public void Player_CanTakeDamage()
    {
        player.TakeDamage(20);
        Assert.AreEqual(80, player.Health);
    }

    [Test]
    public void Player_CanHeal()
    {
        player.Health = 50;
        player.Heal(30);
        Assert.AreEqual(80, player.Health);
    }

    [Test]
    public void Player_CanUseItem()
    {
        player.UseItem("Health Potion");
        Assert.AreEqual(120, player.Health); // Giả sử Health Potion tăng sức khỏe lên 20 điểm
    }

    [Test]
    public void Player_CanChangeScene()
    {
        player.ChangeScene("Level2");
        Assert.AreEqual("Level2", player.CurrentScene);
    }

    [Test]
    public void Player_CanChangeCharacter()
    {
        player.ChangeCharacter("Warrior");
        Assert.AreEqual("Warrior", player.CurrentCharacter);
    }
}

public class Player
{
    public int Health { get; set; } = 100;
    public string CurrentScene { get; set; } = "Level1";
    public string CurrentCharacter { get; set; } = "Knight";

    public void TakeDamage(int amount)
    {
        Health -= amount;
        if (Health < 0)
        {
            Health = 0;
        }
    }

    public void Heal(int amount)
    {
        Health += amount;
        if (Health > 100)
        {
            Health = 100;
        }
    }

    public void UseItem(string itemName)
    {
        if (itemName == "Health Potion")
        {
            Heal(20); // Giả sử Health Potion tăng sức khỏe lên 20 điểm
        }
        // Các loại item khác có thể được xử lý ở đây
    }

    public void ChangeScene(string sceneName)
    {
        CurrentScene = sceneName;
        // Code để thực hiện đổi màn chơi sẽ được thêm ở đây
    }

    public void ChangeCharacter(string characterName)
    {
        CurrentCharacter = characterName;
        // Code để thực hiện đổi nhân vật sẽ được thêm ở đây
        switch (characterName)
        {
          case "Knight":
              // Logic để chuyển đổi sang nhân vật Knight
              // Ví dụ: playerModel.ChangeModel("Knight");
              break;
          case "Wizard":
              // Logic để chuyển đổi sang nhân vật Wizard
              // Ví dụ: playerModel.ChangeModel("Wizard");
              break;
          // Các case khác nếu có
          default:
              Debug.LogError("Không tìm thấy nhân vật: " + characterName);
              break;
          }
        CurrentCharacter = characterName;
    }
    public void SpawnBoss(string bossName)
    {
        switch (bossName)
        {
            case "Dragon":
                // Logic để tạo ra con boss Dragon
                // Ví dụ: bossSpawner.Spawn("Dragon");
                break;
            case "Goblin King":
                // Logic để tạo ra con boss Goblin King
                // Ví dụ: bossSpawner.Spawn("Goblin King");
                break;
            // Các case khác nếu có
            default:
                Debug.LogError("Không tìm thấy con boss: " + bossName);
                break;
        }
        SpawnedBoss = bossName;
    }
}
