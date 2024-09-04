using System;

namespace DockerApp
{
  public static class Adder
  {
    public static int Sum(int a, int b)
    {
      if (a > 5)
      {
        Console.WriteLine("Verifying coverage that test won't reach");
      }
      return a + b;
    }
  }
}
