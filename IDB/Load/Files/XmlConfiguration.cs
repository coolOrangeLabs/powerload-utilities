﻿using System.Diagnostics;
using System.Xml.Linq;

namespace IDB.Load.Files
{
    internal class XmlConfiguration
    {
        private const string XmlFile = "IDB.Load.Files.Default.Behaviors.xml";

        private static XDocument GetXmlDocument()
        {
            var document = new XDocument();
            try
            {
                document = XDocument.Load(XmlFile);
            }
            catch
            {
                Debug.WriteLine("Config was not found");
            }
            return document;
        }

        internal static string GetBehavior(string node, string subNode = null)
        {
            var document = GetXmlDocument();
            var rootElement = document.Element("Root");
            var mainElement = rootElement.Element(node);

            if (subNode == null)
                return mainElement.Value;

            var subElement = mainElement.Element(subNode);
            return subElement.Value;
        }

        internal static void SetBehavior(string node, string value)
        {
            var document = GetXmlDocument();
            var rootElement = document.Element("Root");
            var mainElement = rootElement.Element(node);

            mainElement.RemoveAttributes();
            mainElement.SetValue(value);
            document.Save(XmlFile);
            Logger.Log.Info(":Value has been save:" + value);
        }
    }
}