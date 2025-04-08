using Microsoft.AspNetCore.Mvc;
using BLL.API;
using BLL.Models;
using DAL.Models;
namespace WebAPI.Controllers;

[ApiController]
[Route("[controller]")]
public class GroceryController : ControllerBase
{
    
    IOrdersManagment ordersManagment;

    public GroceryController( IOrdersManagment _ordersManagment)
    {
        ordersManagment = _ordersManagment;
    }

    [HttpPost("OrderingGoods")]
    public async Task<ActionResult<int>> CreateOrder([FromBody]string company,[FromQuery] Dictionary<string, int> products)
    {
        //var supplierId= ordersManagment.GetSupplierIdByCompany(company).GetAwaiter().GetResult();

         OrderBLL order = new OrderBLL()
        {
            //Supplier = ordersManagment.GetSupplierIdByCompany(company).GetAwaiter().GetResult(),
            SupplierId = ordersManagment.GetSupplierIdByCompany(company).GetAwaiter().GetResult().Id

        };
        int orderNum = await ordersManagment.CreateOrder(products, order.Convert());
        if (orderNum < 0)
        {
            return StatusCode(403, "cannt creat order");
        }
        
        return Ok(orderNum );
    }
    [HttpPost("OrdeCompletionConfirmation")]
    public Task OrdeCompletionConfirmation([FromBody]int orderNum)
    {
        return ordersManagment.OrdeCompletionConfirmation(orderNum);
    }

    [HttpGet("GetAllOrders")]
    public async Task<IActionResult> GetOrders()
    {
        var orders = await ordersManagment.GetAllOrders();
        return Ok(orders);
    }
    [HttpGet("GetAllWaitingOrders")]
    public async Task<IActionResult> GetAllWaitingOrders()
    {
        var orders = await ordersManagment.GetAllWaitingOrders();
        return Ok(orders);
    }

    [HttpGet("ConfirmationReceipOrder")]
    public async Task<IActionResult> ConfirmationReceipOrder(int orderNum)
    {
         return Ok(await ordersManagment.ConfirmationReceipOrder(orderNum));
    }
}
