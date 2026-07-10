class Program
{
    static void Main(string[] args)
    {
        Logger log1 = Logger.GetInstance();
        Logger log2 = Logger.GetInstance();

        log1.Log("First log message");
        log2.Log("Second log message");

        if (log1 == log2)
            Console.WriteLine("Both variables point to the same Logger instance. Singleton works!");
        else
            Console.WriteLine("Different instances. Singleton NOT working.");
    }
}
