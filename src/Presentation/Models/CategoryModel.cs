using System.ComponentModel.DataAnnotations;

namespace Presentation.Models
{
    public class CategoryModel
    {
        [Required(ErrorMessage = "Name is required.")]
        [MaxLength(255)]
        public string Name { get; set; }

        [Required(ErrorMessage = "Description is required.")]
        [MaxLength(500)]
        public string Description { get; set; }
    }
}