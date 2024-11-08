*&---------------------------------------------------------------------*
*& Report ZDLFAJRRP_007_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDLFAJRRP_007_05.

INCLUDE zdlfajrrp_007_05_cl.

INITIALIZATION.
DATA(go_atividade) = NEW zdlfajrcl_001_05( ).
DATA(lo_atividade) = NEW lcl_atividade_007( ).