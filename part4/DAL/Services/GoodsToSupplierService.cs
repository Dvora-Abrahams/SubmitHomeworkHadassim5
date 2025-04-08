﻿using DAL.API;
using DAL.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Services
{
    public class GoodsToSupplierService : IGoodsToSupplierService
    {
        private  DB_Manager _context;
        public GoodsToSupplierService()
        {
            _context=new DB_Manager();
        }

        public async Task AddGoodsToSupplier(int supplierId, int goodsId)
        {
            var exists = await _context.GoodsToSuppliers.AnyAsync(gs => gs.SuppliersId == supplierId && gs.GoodsId == goodsId);

            var goodsToSupplier = new GoodsToSupplier
            {
                SuppliersId = supplierId,
                GoodsId = goodsId,

            };

            _context.GoodsToSuppliers.Add(goodsToSupplier);
            await _context.SaveChangesAsync();
        }


        //public void DeleteGoodsToSupplier(int supplierId, int goodsId)
        //{
        //    var goodsToSupplier = _context.GoodsToSuppliers.FirstOrDefault(gs => gs.SuppliersId == supplierId && gs.GoodsId == goodsId);
        //    if (goodsToSupplier != null)
        //    {
        //        _context.GoodsToSuppliers.Remove(goodsToSupplier);
        //        _context.SaveChanges();
        //    }
        //}

        //public List<GoodsToSupplier> GetAllGoodsToSuppliers()
        //{
        //    return _context.GoodsToSuppliers.ToList();
        //}

        public async Task<List<Good>> GetGoodsToSupplierBySupplierId(int SupplierId)
        {
            List<int> lst = await _context.GoodsToSuppliers
                .Where(gs => gs.SuppliersId == SupplierId)
                .Select(gs => gs.GoodsId)
                .ToListAsync();

            List<Good> goods = new List<Good>();

            foreach (int id in lst)
            {
                var good = _context.Goods.FirstOrDefaultAsync(g => g.Id == id).GetAwaiter().GetResult();
                if(good!= null)
                    goods.Add(good);
            }

            return goods;
        }


    }
}
