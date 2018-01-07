using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemByDigiminds.Gateway;
using UniversityManagementSystemByDigiminds.Models;

namespace UniversityManagementSystemByDigiminds.Manager
{
    public class RoomManager
    {
        RoomGateway roomGateway = new RoomGateway();
        public List<Room> GetAllRooms()
        {
            return roomGateway.GetAllRooms();
        }
    }
}