using Microsoft.AspNetCore.Mvc;
using MvcMovie.Controllers;

namespace MvcMovie.Tests.Controllers;

[TestFixture]
public class HelloWorldControllerTests
{
    [Test]
    public void Index_ReturnsViewResult()
    {
        var controller = new HelloWorldController();

        var result = controller.Index();

        Assert.That(result, Is.TypeOf<ViewResult>());
    }

    [Test]
    public void Welcome_SetsExpectedViewDataAndReturnsView()
    {
        var controller = new HelloWorldController();

        var result = controller.Welcome("Rick", 3);

        Assert.That(result, Is.TypeOf<ViewResult>());
        Assert.That(controller.ViewData["Message"], Is.EqualTo("Hello Rick"));
        Assert.That(controller.ViewData["NumTimes"], Is.EqualTo(3));
    }
}
