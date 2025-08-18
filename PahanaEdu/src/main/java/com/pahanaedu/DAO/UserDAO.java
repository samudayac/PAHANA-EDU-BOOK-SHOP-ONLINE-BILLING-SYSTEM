
package com.pahanaedu.DAO;

import com.pahanaedu.entity.User;
import java.util.List;


public interface UserDAO {
    
    public boolean userRegister(User us);
    
    public User login(String email,String password);
    
    public List<User> getAllUsers();
            
    public User getUserById(int id);
    
    public boolean updatedEditUsers(User u);
    
    public boolean deleteUser(int id);
    
}
