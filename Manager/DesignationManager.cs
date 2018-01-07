using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemByDigiminds.Gateway;
using UniversityManagementSystemByDigiminds.Models;

namespace UniversityManagementSystemByDigiminds.Manager
{
    public class DesignationManager
    {
        public List<Designation> GetAll()
        {
            DesignationGateway designationGateway = new DesignationGateway();
            return designationGateway.GetAll();
        }
    }
}