using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using MvcMovie.Models;

namespace MvcMovie.Tests.Models;

[TestFixture]
public class MovieTests
{
    [Test]
    public void ReleaseDate_HasDisplayNameAttribute()
    {
        var property = typeof(Movie).GetProperty(nameof(Movie.ReleaseDate));

        Assert.That(property, Is.Not.Null);

        var displayAttribute = property!
            .GetCustomAttributes(typeof(DisplayAttribute), false)
            .Cast<DisplayAttribute>()
            .SingleOrDefault();

        Assert.That(displayAttribute, Is.Not.Null);
        Assert.That(displayAttribute!.Name, Is.EqualTo("Release Date"));
    }

    [Test]
    public void ReleaseDate_HasDateDataTypeAttribute()
    {
        var property = typeof(Movie).GetProperty(nameof(Movie.ReleaseDate));

        Assert.That(property, Is.Not.Null);

        var dataTypeAttribute = property!
            .GetCustomAttributes(typeof(DataTypeAttribute), false)
            .Cast<DataTypeAttribute>()
            .SingleOrDefault();

        Assert.That(dataTypeAttribute, Is.Not.Null);
        Assert.That(dataTypeAttribute!.DataType, Is.EqualTo(DataType.Date));
    }

    [Test]
    public void Price_HasExpectedColumnType()
    {
        var property = typeof(Movie).GetProperty(nameof(Movie.Price));

        Assert.That(property, Is.Not.Null);

        var columnAttribute = property!
            .GetCustomAttributes(typeof(ColumnAttribute), false)
            .Cast<ColumnAttribute>()
            .SingleOrDefault();

        Assert.That(columnAttribute, Is.Not.Null);
        Assert.That(columnAttribute!.TypeName, Is.EqualTo("decimal(18, 2)"));
    }
}
