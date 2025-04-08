using Microsoft.AspNetCore.Mvc;
using BLL.API;
using BLL.Models;
using Microsoft.EntityFrameworkCore.ChangeTracking.Internal;

namespace WebAPI.Controllers
{

    [ApiController]
    [Route("[controller]")]
    public class SuppliersController : Controller
    {
        //private readonly ILogger<SuppliersController> _logger;
        IOrdersManagment ordersManagment;

        public SuppliersController(IOrdersManagment _ordersManagment)
        {
            ordersManagment = _ordersManagment;
        }

        [HttpPost("creatSupplier")]
        public async Task<IActionResult> creatSupplier([FromBody] SuppliersBLL sup)
        {
            return Ok(ordersManagment.creatSupplier(sup.Convert()));
        }

        [HttpPost("RegisteredSupplier")]
        public async Task<bool> proxyToSuppliers([FromQuery] string company, string phone)
        {
            return await ordersManagment.proxyToSuppliers(company, phone);
        }

        [HttpPost("AddGoodsToSupplier")]
        public async Task<IActionResult> AddGoodsToSupplier(string company, [FromBody]Dictionary<string, float> dict, int n)
        {
            if (await ordersManagment.AddGoodsToSupplier(company, dict, n) == true)
                return Ok();
            return StatusCode(403, "Cannt add good to supplier");
        }

        [HttpGet("GetOrderByCompany")]
        public async Task<IActionResult> GetOrderByCompany(string company)
        {
            var orders = await ordersManagment.GetOrderByCompanyName(company);
            return Ok(orders);
        }
        [HttpGet("GetCompletedOrderByCompany")]
        public async Task<IActionResult> GetCompletedOrderByCompany(string company)
        {
            var orders = await ordersManagment.GetCompletedOrderByCompanyName(company);
            return Ok(orders);
        }


        [HttpPut("ConfirmationReceipOrder")]
        public async Task<ActionResult<bool>> ConfirmationReceipOrder(int orderId)
        {
            bool b = await ordersManagment.ConfirmationReceipOrder(orderId);
            if (b == true)
                return Ok(b);
            return StatusCode(404, "cannt Confirmation Receip Order");
        }



    }
}
