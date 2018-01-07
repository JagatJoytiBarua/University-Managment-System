using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemByDigiminds.Gateway;
using UniversityManagementSystemByDigiminds.Models;

namespace UniversityManagementSystemByDigiminds.Manager
{
    public class SemesterManager
    {
        private SemesterGateway semesterGateway = new SemesterGateway();

        public List<Semester> GetAll()
        {
            return semesterGateway.GetAll();
        }
    }
}