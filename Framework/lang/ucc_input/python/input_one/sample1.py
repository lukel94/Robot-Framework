from Tkinter import *

class KeyDemo( Frame ):
   def __init__( self ):
      Frame.__init__( self )
      self.pack( expand = YES, fill = BOTH )
      self.master.title( "Demonstrating Keystroke Events" )
      self.master.geometry( "350x50" )

      self.message1 = StringVar()
      self.line1 = Label( self, textvariable = self.message1 )
      self.message1.set( "Type any key or shift" )
      self.line1.pack()

      self.message2 = StringVar()
      self.line2 = Label( self, textvariable = self.message2 )
      self.message2.set( "" )
      self.line2.pack()

      self.master.bind( "<KeyPress-Shift_L>", self.shiftPressed )
      self.master.bind( "<KeyRelease-Shift_L>", self.shiftReleased )

   
   def shiftPressed( self, event ):
      self.message1.set( "Shift pressed" )
      self.message2.set( "This key is left shift" )

   def shiftReleased( self, event ):
      self.message1.set( "Shift released" )
      self.message2.set( "This key is left shift" )
   
def main():
   KeyDemo().mainloop()

if __name__ == "__main__":
   main()
