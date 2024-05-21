using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YamiChatLibrary
{
    public class YamiChatBot
    {

        public string FormatInput(string chat, string context, string previousAnswer)
        {
            if (context == null || previousAnswer == null)
            {
                return chat;
            }
            else
            {
                string formattedInput = $"{context}\n\n{previousAnswer}\n\n{chat}";
                return formattedInput;
            }
        }

        public string PostprocessOutput(string output)
        {
            output = output.Trim();

            if (!string.IsNullOrEmpty(output))
            {
                output = char.ToUpper(output[0]) + output.Substring(1);
            }

            if (output.StartsWith("Hi") || output.StartsWith("Hello"))
            {
                output = "Xin chào, tôi là chat bot Yami-chan, rất vui được gặp bạn!";
            }

            return output;
        }
    }
}
