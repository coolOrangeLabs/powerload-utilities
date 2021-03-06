﻿using System;
using System.Collections.Generic;

namespace IDB.Translate.BCP.DbEntity
{
    public class Folder : IDbEntity
    {
        public int FolderID { get; set; }
        public int? ParentFolderID { get; set; }
        public string FolderName { get; set; }
        public string Path { get; set; }
        public bool IsLibrary { get; set; }
        public string Category { get; set; }
        public string LifecycleState { get; set; }
        public string LifecycleDefinition { get; set; }
        public string CreateUser { get; set; }
        public DateTime CreateDate { get; set; }
        public Dictionary<string, object> UserDefinedProperties { get; set; }
        public bcpDevKit.Entities.Vault.FolderObject BcpFolderObject { get; set; }
    }
}