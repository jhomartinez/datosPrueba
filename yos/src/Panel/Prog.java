package Panel;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
	
public class Prog {
	public static void main(String[] args)
	{
		int personaje = Integer.parseInt(JOptionPane.showInputDialog(null, "Escoje el jugador? \n1.Yoshy\n2.Mario", "Jugador", JOptionPane.INFORMATION_MESSAGE));
		Ventana vent1 = null;
		if(personaje == 1){
			vent1 = new Ventana("Mario MATE!", 1);
		} else {
			vent1 = new Ventana("JOSHY MATE!", 2);
		}
		vent1.setSize(550, 500);
		vent1.setVisible(true);
	}

}
