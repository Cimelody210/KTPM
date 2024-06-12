using System;
using System.IO;
using UnityEngine;
using NUnit.Framework;
using SQLite;
using System.Collections.Generic;

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
    public string SpawnedBoss { get; set; }

    // Danh sách các nhân vật
    public List<GameObject> characters = new List<GameObject>();
    private GameObject selectedCharacter;


    private AudioSource audioSource;
    public AudioClip backgroundMusicLevel1;
    public AudioClip backgroundMusicLevel2;

    public class CharacterData
    {
        [PrimaryKey]
        public int Id { get; set; }
        public string Name { get; set; }

        // Các thuộc tính khác của nhân vật
        public string Anime {get; set;}
    }

    public void SelectCharacter(int index)
    {
        // // Kiểm tra xem index có hợp lệ không
        // if (index >= 0 && index < characters.Length)
        // {
        //     // Lấy nhân vật từ danh sách dựa trên index
        //     selectedCharacter = characters[index];
        //     Debug.Log("Selected character: " + selectedCharacter.name);

        //     // Thực hiện hành động khi chọn nhân vật, ví dụ như thay đổi model nhân vật hiển thị trên màn hình
        //     // Ví dụ: selectedCharacter.SetActive(true);
        // }
        // else
        // {
        //     Debug.LogError("Invalid character index!");
        // }
        string connectionString = "URI=file:" + Application.dataPath + "/CharactersDatabase.sqlite";
        using (var connection = new SQLiteConnection(connectionString))
        {
            // Truy vấn cơ sở dữ liệu để lấy thông tin về các nhân vật
            var query = "SELECT * FROM Characters";
            var characterData = connection.Query<CharacterData>(query);
            
            // Thêm thông tin của các nhân vật vào danh sách
            characters.AddRange(characterData);
        }
        
        // In ra thông tin về các nhân vật
        foreach (var character in characters)
        {
            Debug.Log("ID nhân vật " + character.Id + ", Name: " + character.Name + "den tu bo anime"+ character.Anime);
        }
    }
    public Player()
    {
        // Khởi tạo audioSource và các AudioClip
        audioSource = GameObject.FindObjectOfType<AudioSource>();
        backgroundMusicLevel1 = Resources.Load<AudioClip>("BackgroundMusic_Level1");
        backgroundMusicLevel2 = Resources.Load<AudioClip>("BackgroundMusic_Level2");
    }


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
    private void PlayBackgroundMusic(string sceneName)
    {
        switch (sceneName)
        {
            case "Level1":
                // Logic để phát nhạc nền của Level1
                audioSource.clip = backgroundMusicLevel1;
                break;
            case "Level2":
                // Logic để phát nhạc nền của Level2
                audioSource.clip = backgroundMusicLevel2;
                break;
            // Các case khác nếu có
            default:
                break;
        }
        audioSource.Play();

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
          case "Ukraine":
              // Logic để chuyển đổi sang nhân vật Wizard
              // In một thông báo thông thường
              string boss_Ukr = "Zelensky";
              string boss_Ukr1 = "";
              // Ví dụ: playerModel.ChangeModel("Wizard");
              Debug.LogWarning("Bjdhfhfhfyy ovjfh")
              break;
          // Các case khác nếu có
          default:
              Debug.LogError("Không tìm thấy nhân vật: " + characterName);
              break;
          }
        CurrentCharacter = characterName;
    }
    private void PlayBossMusic(string bossName)
    {
        switch (bossName)
        {
            case "Dragon":
                // Logic để phát nhạc và lời của con boss Dragon
                break;
            case "Goblin King":
                // Logic để phát nhạc và lời của con boss Goblin King
                break;
            // Các case khác nếu có
            default:
                break;
        }
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
