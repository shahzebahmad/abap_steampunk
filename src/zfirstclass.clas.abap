CLASS zfirstclass DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfirstclass IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |Hello RAP Programmng from { cl_abap_context_info=>get_user_technical_name(  ) }| ).
  ENDMETHOD.

ENDCLASS.
