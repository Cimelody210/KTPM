
using System.IO;
using System.Data.Common;

namespace UnitTestCalLib
{
    public class TestData
    {
        public double a;
        public double b;
        public double result;
        public TestData(double a, double b, double res)
        {
            this.a = a;
            this.b = b;
            this.result = res;
        }
    }
    [TestClass]
  

    internal class TestMethodAttribute : Attribute
    {
    }

    internal class TestClassAttribute : Attribute
    {
    }
}