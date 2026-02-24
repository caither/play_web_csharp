using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;

namespace MvcMovie.Models;

public class MovieGenreViewModel
{
    public List<Movie>? Movies { get; set; }
    public SelectList? Genres { get; set; }
    public string? MovieGenre { get; set; }  // 用於 強型別View 的 asp-for
    public string? SearchString { get; set; }  // 用於 強型別View 的 asp-for

}

