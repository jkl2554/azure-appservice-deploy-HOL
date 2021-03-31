using System;
using System.ComponentModel.DataAnnotations;

namespace TodoList.Models
{
    public class Todo
    {
        public Guid ID { get; set; }
        public string Description { get; set; } = null!;

        

        [Display(Name = "Created Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime CreatedDate { get; set; }
    }
}