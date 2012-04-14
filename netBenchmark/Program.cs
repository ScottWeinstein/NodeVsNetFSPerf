using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace netBenchmark
{
    class Program
    {
        public static void ProcessDir(string path)
        {
            foreach (var fileName in Directory.EnumerateFileSystemEntries(path))
            {
                var info = File.GetAttributes(fileName);
                if ((info & FileAttributes.Directory) == FileAttributes.Directory)
                {
                    ProcessDir(fileName);
                }
                else
                {
                	File.ReadAllBytes(fileName);
                }
            }
        }

        static void Main(string[] args)
        {
            var dir = args[0];
            ProcessDir(dir);
        }
    }
}
