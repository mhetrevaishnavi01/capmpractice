using {ust.reuse as reuse } from './reuse';
using { cuid } from '@sap/cds/common';

namespace ust.transport.rfc;

context master{
  
    entity employee:reuse.address {
        key id:reuse.PrimaryId;
        dept:Association to  one department; //no id because it automatically takes id of parent table so give only class 
        name:String(34);
        age:Integer;
        manager:Association to manager;
        course:Association to many courses;
        book:Association to books;
        //bid:type of books:code
        
    }
    entity courses{
        name:String(30);
        employee:Association to many employee;
    }
    entity manager:cuid{
        name:String(30);
        area:String(30);     
    }
    entity department{
        key id:reuse.PrimaryId;
        name:String(32);
        employee:Association to many employee;
    }
    entity books:cuid {  
      name:localized String(30);
      author:String(25)
    }
}

