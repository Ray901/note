VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True'
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub SetLink()
    Dim x As Integer
    Dim n As String
    
    Cells(3, 1) = "���"
    Cells(3, 2) = "����"
    Cells(3, 3) = "��;"
    Cells(3, 4) = "��ע"
    Cells(3, 5) = "��������"
    Cells(3, 6) = "�޸�����"
    Cells(3, 7) = "�޸ļ�¼"
    ' ��һ��sheet ��Ŀ¼,�ڶ�����DataDic, ��������'
    For x = 3 To Worksheets.Count
        If Worksheets(x).Name <> "Ŀ¼" Then
            
            n = Worksheets(x).Name
            Cells(x + 1, 1) = x - 2
            Cells(x + 1, 2).Select
              ActiveSheet.Hyperlinks.Add Anchor:=Selection, Address:="", SubAddress:=n & "!B1", TextToDisplay:=n
        End If
		'���ӷ���Ŀ¼������'
       Sheets(x).Hyperlinks.Add Anchor:=Sheets(x).Range("C1"), Address:="", SubAddress:="Ŀ¼" & "!B" & (x + 1), TextToDisplay:="����Ŀ¼"
    Next
End Sub