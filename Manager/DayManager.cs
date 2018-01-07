using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemByDigiminds.Gateway;
using UniversityManagementSystemByDigiminds.Models;

namespace UniversityManagementSystemByDigiminds.Manager
{
    public class DayManager
    {
        DayGateway aDayGateway=new DayGateway();
        public IEnumerable<Day> GetAllDays()
        {
            return aDayGateway.GetAllDays();
        }
    }
}