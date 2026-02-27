using System.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MvcMovie.Controllers;
using MvcMovie.Models;

namespace MvcMovie.Tests.Controllers;

[TestFixture]
public class HomeControllerTests
{
    [Test]
    public void Index_ReturnsViewResult()
    {
        var controller = new HomeController();

        var result = controller.Index();

        Assert.That(result, Is.TypeOf<ViewResult>());
    }

    [Test]
    public void Privacy_ReturnsViewResult()
    {
        var controller = new HomeController();

        var result = controller.Privacy();

        Assert.That(result, Is.TypeOf<ViewResult>());
    }

    [Test]
    public void Error_ReturnsViewResultWithErrorViewModel()
    {
        var controller = new HomeController();
        var httpContext = new DefaultHttpContext();
        controller.ControllerContext = new ControllerContext
        {
            HttpContext = httpContext
        };

        using var activity = new Activity("test");
        activity.Start();

        var result = controller.Error() as ViewResult;

        Assert.That(result, Is.Not.Null);
        Assert.That(result!.Model, Is.TypeOf<ErrorViewModel>());

        var model = (ErrorViewModel)result.Model!;
        Assert.That(model.RequestId, Is.Not.Null.And.Not.Empty);
    }
}
