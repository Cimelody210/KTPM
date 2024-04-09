using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CalLib;

namespace UnitTestCalLib
{
    public class UnitTestOperations
    {
        [TestMethod]
        public void SummarationTest()
        {
            var testData = new TestData[]
            {
                new TestData(1.1,2.3,3.4),
                new TestData(2,3,4),
                new TestData(10,10,100)
            };
            foreach (var data in testData)
            {

            }
        }
    }
}
