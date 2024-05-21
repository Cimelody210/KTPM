using NUnit.Framework;
using yami_ai;
using NUnit.Framework;
using YamiChatLibrary;

namespace Test
{
    public class Tests
    {

        [TestFixture]
        public class Form1Tests
        {
            [Test]
            public void FormatInput_Returns_CorrectlyFormattedInput()
            {
                // Arrange
                var chatBot = new YamiChatBot();
                string chat = "How are you?";
                string context = "Previous context";
                string previousAnswer = "Previous answer";

                // Act
                var formattedInput = chatBot.FormatInput(chat, context, previousAnswer);

                // Assert
                Assert.AreEqual("Previous context\n\nPrevious answer\n\nHow are you?", formattedInput);
            }

            [Test]
            public void PostprocessOutput_CapitalizesFirstCharacter()
            {
                // Arrange
                var chatBot = new YamiChatBot();
                string output = "hello world";

                // Act
                var processedOutput = chatBot.PostprocessOutput(output);

                // Assert
                Assert.AreEqual("Hello world", processedOutput);
            }
        }
    }
    
  
}