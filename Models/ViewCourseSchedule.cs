﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemByDigiminds.Models
{
    public class ViewCourseSchedule
    {

        public int DepartmentId { get; set; }
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public string CourseCode { get; set; }
        public string ScheduleInfo { get; set; }
        public string AllocateStatus { get; set; }
    }
}