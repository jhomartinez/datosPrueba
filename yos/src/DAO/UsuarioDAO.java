package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Model.Usuario;

public class UsuarioDAO {

	Usuario buscarUsuario(String id) {
		Usuario x  = null;
		
		ConexionMySQL mysql = new ConexionMySQL();

        

		try {
		
			java.sql.Connection con= mysql.Conectar();
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery ("select * from usuario where id:");
		    
			while (rs.next())
            {
                System.out.println (rs.getInt ("Id") + " " + rs.getString (2)+ 
                    " " + rs.getDate(3));
            }
		                
		} catch (SQLException e) {
		    
		}

		
		return null;
	}

}
