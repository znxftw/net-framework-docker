using Xunit;

namespace DockerApp.Test
{
  public class AdderTest
  {
    [Fact]
    public void ShouldAddTwoNumbers()
    {
      Assert.Equal(Adder.Sum(5, 5), 10);
    }
  }
}
