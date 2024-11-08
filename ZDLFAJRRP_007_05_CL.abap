*&---------------------------------------------------------------------*
*& Include          ZDLFAJRRP_007_05_CL
*&---------------------------------------------------------------------*

CLASS lcl_atividade_007 DEFINITION.
  PUBLIC SECTION.
    DATA: lv_datum TYPE dats.

    METHODS:
      modificar_atividade  IMPORTING VALUE(is_atividade) TYPE zdlfajrt_002_05,
      deletar_atividade    IMPORTING VALUE(iv_atividade) TYPE zdlfajrt_002_05
                           RETURNING VALUE(rv_operation) TYPE char1,
      selecionar_atividade EXPORTING VALUE(et_atividades) TYPE zdlfajrtt_002_05.
ENDCLASS.

CLASS lcl_atividade_007 IMPLEMENTATION.

  METHOD modificar_atividade.

    DATA: ls_atividade TYPE zdlfajrt_002_05.

    ls_atividade = is_atividade.

    ls_atividade-modificado_por = sy-uname. " Pega o nome do usuário
    ls_atividade-modificado_em_data = sy-datum. " Pega a data atual do sistema
    ls_atividade-modificado_em_hora = sy-uzeit. " Pega a hora atual do sistema

    MODIFY zdlfajrt_002_05
      FROM ls_atividade.
  ENDMETHOD.

  METHOD deletar_atividade.
    DELETE
      FROM zdlfajrt_002_05
      WHERE atividade EQ iv_atividade.

    IF sy-subrc EQ 0.
      rv_operation = 'S'.
    ELSE.
      rv_operation = 'E'.
    ENDIF.
  ENDMETHOD.

  METHOD selecionar_atividade.
    SELECT *
      FROM zdlfajrt_002_05
*      INTO TABLE @DATA(lt_atividades)
      INTO TABLE @et_atividades.
  ENDMETHOD.

ENDCLASS.