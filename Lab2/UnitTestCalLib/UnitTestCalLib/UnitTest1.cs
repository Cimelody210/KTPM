
namespace UnitTestCalLib
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public class UnitTestOperation
        {
            [TestMethod]
            public void SummrationTest() 
            {
                var testData = new TestData[]
                {
                    new TestData(1.1,1.2,2.3),
                    new TestData(2,3,4),
                    new TestData(20,20,30)
                };

                foreach (var data in testData) {
                    
                }
            }
            
        }
        
        public class TestData
        {
            public double a;
            public double b;
            public double result;
            public TestData(double a, double b, double res)
            {
                this.a  =a ; this.b = b; this.result = res;
            }
        }
    }
    
    internal class TestMethodAttribute : Attribute
    {
    }

    internal class TestClassAttribute : Attribute
    {
    }
}