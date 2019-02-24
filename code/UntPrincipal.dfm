object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Natal Marmitas'
  ClientHeight = 319
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = -20
    Width = 505
    Height = 341
    ActivePage = TS_Inicial
    TabOrder = 0
    object TS_Inicial: TTabSheet
      Caption = 'TS_Inicial'
      OnShow = TS_InicialShow
      object Label1: TLabel
        Left = 80
        Top = 70
        Width = 72
        Height = 13
        Caption = 'Ol'#225', Bem Vindo'
      end
      object StringGrid1: TStringGrid
        Left = 230
        Top = 24
        Width = 250
        Height = 253
        Color = clBtnFace
        ColCount = 2
        DefaultColWidth = 50
        Enabled = False
        FixedCols = 0
        RowCount = 10
        FixedRows = 0
        ScrollBars = ssNone
        TabOrder = 0
        ColWidths = (
          50
          50)
        RowHeights = (
          24
          24
          24
          24
          24
          24
          24
          24
          24
          24)
      end
      object Button1: TButton
        Left = 24
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Novo Dia'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 120
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Novo Pedido'
        TabOrder = 2
        OnClick = Button3Click
      end
      object ListBox1: TListBox
        Left = 24
        Top = 89
        Width = 171
        Height = 221
        ItemHeight = 13
        TabOrder = 3
        OnClick = ListBox1Click
      end
      object Panel1: TPanel
        Left = 230
        Top = 24
        Width = 250
        Height = 253
        TabOrder = 4
        Visible = False
        object Memo2: TMemo
          Left = 0
          Top = 0
          Width = 250
          Height = 253
          Enabled = False
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 222
          Top = 2
          Width = 26
          Height = 26
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5868686626262515151636363878787D6
            D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE1D1D1D00000000000000
            0000000000000000000000000000202020BDBDBDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F35E5E5E00
            0000232323767676D2D2D2FFFFFFFFFFFFFFFFFFD1D1D1767676222222000000
            626262F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFF2F2F24545450000007E7E7EECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEBEBEB7C7C7C000000464646F3F3F3FFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFF5E5E5E0000008E8E8EFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D8D0000006060
            60FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFBBBBBB0000007E7E7E
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF7C7C7C000000BEBEBEFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFF1D1D1D232323ECECECFFFFFFFFFFFFF2F2F2AAAAAAFAFAFAFFFFFFFFFF
            FFFFFFFFFAFAFAAAAAAAF2F2F2FFFFFFFFFFFFEBEBEB2323231F1F1FFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFD4D4D4000000787878FFFFFFFFFFFFFFFFFFAAAA
            AA000000575757FFFFFFFFFFFFFFFFFF575757000000AAAAAAFFFFFFFFFFFFFF
            FFFF767676000000D7D7D7FFFFFFFFFFFF00FFFFFFFFFFFF858585000000D1D1
            D1FFFFFFFFFFFFFFFFFFFAFAFA575757000000646464FFFFFF64646400000057
            5757FAFAFAFFFFFFFFFFFFFFFFFFD1D1D1000000888888FFFFFFFFFFFF00FFFF
            FFFFFFFF626262000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63636300
            0000040404000000636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
            616161FFFFFFFFFFFF00FFFFFFFFFFFF525252000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF040404000000040404FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF000000525252FFFFFFFFFFFF00FFFFFFFFFFFF62626200
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF636363000000040404000000
            636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000616161FFFFFFFFFF
            FF00FFFFFFFFFFFF858585000000D2D2D2FFFFFFFFFFFFFFFFFFFAFAFA575757
            000000646464FFFFFF646464000000575757FAFAFAFFFFFFFFFFFFFFFFFFD1D1
            D1000000878787FFFFFFFFFFFF00FFFFFFFFFFFFD4D4D4000000797979FFFFFF
            FFFFFFFFFFFFAAAAAA000000575757FFFFFFFFFFFFFFFFFF575757000000AAAA
            AAFFFFFFFFFFFFFFFFFF777777000000D6D6D6FFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFF1C1C1C242424EDEDEDFFFFFFFFFFFFF2F2F2AAAAAAFAFAFAFFFFFFFFFF
            FFFFFFFFFAFAFAAAAAAAF2F2F2FFFFFFFFFFFFECECEC2323231E1E1EFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFBABABA0000007F7F7FFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E
            7E7E000000BCBCBCFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF5E5E
            5E000000909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF8E8E8E000000606060FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFF1F1F14343430000007F7F7FECECECFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED7D7D7D000000444444F2F2F2FFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F15D5D5D00
            0000232323787878D3D3D3FFFFFFFFFFFFFFFFFFD2D2D2787878232323000000
            5E5E5EF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFBABABA1C1C1C000000000000000000000000000000
            0000000000001D1D1DBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3
            858585626262505050626262868686D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 1
          OnClick = BitBtn1Click
        end
        object Button7: TButton
          Left = 87
          Top = 228
          Width = 75
          Height = 25
          Caption = 'Entregue'
          TabOrder = 2
          OnClick = Button7Click
        end
      end
      object Button6: TButton
        Left = 230
        Top = 283
        Width = 250
        Height = 25
        Caption = 'Finalizar Dia'
        TabOrder = 5
        OnClick = Button6Click
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 1
      OnShow = TabSheet1Show
      object Button2: TButton
        Left = 170
        Top = 99
        Width = 75
        Height = 25
        Caption = 'Concluir'
        TabOrder = 5
        OnClick = Button2Click
      end
      object LabeledEdit1: TLabeledEdit
        Left = 170
        Top = 24
        Width = 310
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        TabOrder = 1
      end
      object LabeledEdit2: TLabeledEdit
        Left = 3
        Top = 72
        Width = 121
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Troco'
        TabOrder = 2
      end
      object CheckListBox1: TCheckListBox
        Left = 319
        Top = 69
        Width = 161
        Height = 241
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ItemHeight = 23
        Items.Strings = (
          'Arroz'
          'Feij'#227'o'
          'Macar'#227'o'
          'Salada'
          'Acompanhamento'
          'Carne1'
          'Carne2'
          'Carne3'
          'Farofa'
          'Refri')
        ParentFont = False
        TabOrder = 4
        OnClick = CheckListBox1Click
      end
      object Memo1: TMemo
        Left = 3
        Top = 144
        Width = 310
        Height = 166
        Lines.Strings = (
          'Nome:'
          ''
          ''
          'Endere'#231'o:'
          ''
          ''
          ''
          'Troco:'
          ''
          ''
          'Hor'#225'rio')
        TabOrder = 8
      end
      object LabeledEdit4: TLabeledEdit
        Left = 3
        Top = 24
        Width = 161
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 0
      end
      object Button4: TButton
        Left = 64
        Top = 99
        Width = 60
        Height = 25
        Caption = 'Voltar'
        TabOrder = 7
        OnClick = Button4Click
      end
      object ComboBox1: TComboBox
        Left = 170
        Top = 72
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'Hor'#225'rios'
        Items.Strings = (
          '11:30'
          '11:45'
          '12:00'
          '12:15'
          '12:30'
          '12:45'
          '13:00'
          '13:15'
          '13:30'
          '13:45'
          '14:00')
      end
      object Button5: TButton
        Left = 3
        Top = 99
        Width = 60
        Height = 25
        Caption = 'Limpar'
        TabOrder = 6
        OnClick = Button5Click
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 164
    Top = 164
  end
end
