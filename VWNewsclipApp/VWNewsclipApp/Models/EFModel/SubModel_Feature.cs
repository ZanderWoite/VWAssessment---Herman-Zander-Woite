//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VWNewsclipApp.Models.EFModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class SubModel_Feature
    {
        public int SubModel_Feature_ID { get; set; }
        public int Feature_ID { get; set; }
        public int SubModel_ID { get; set; }
    
        public virtual Feature Feature { get; set; }
        public virtual SubModel SubModel { get; set; }
    }
}
