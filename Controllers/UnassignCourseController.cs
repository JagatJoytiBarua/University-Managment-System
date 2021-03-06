﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemByDigiminds.Manager;

namespace UniversityManagementSystemByDigiminds.Controllers
{
    public class UnassignCourseController : Controller
    {
        CourseManager courseManager = new CourseManager();
        //
        // GET: /UnassignCourse/
        public ActionResult UnAssign()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UnAssign(int? id)
        {
            ViewBag.Message = courseManager.UnAssignCourses();
            return View();
        }
	}
}