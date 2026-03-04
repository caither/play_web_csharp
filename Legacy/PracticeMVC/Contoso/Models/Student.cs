using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Contoso.Models
{
    public class Student
    {
        public int ID { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 2)]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        [Required]
        [StringLength(50, ErrorMessage = "名字長度不能超過50個字元。")]
        [Column("FirstName")]
        [Display(Name = "First Name")]
        public string FirstMidName { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Enrollment Date")]
        public DateTime EnrollmentDate { get; set; }

        // 計算屬性，會傳回藉由串連兩個其他屬性而建立的值。 因此它只有一個 get 存取器，資料庫中不會產生任何 FullName 欄位。
        [Display(Name = "Full Name")]
        public string FullName { get { return $"{LastName}, {FirstMidName}"; } }

        public virtual ICollection<Enrollment> Enrollments { get; set; }
    }
}