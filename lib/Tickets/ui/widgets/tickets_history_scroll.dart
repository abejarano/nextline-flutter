import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/Tickets/ui/screens/chat.dart';
import 'package:nextline/Tickets/ui/widgets/ticket_row.dart';
import 'package:nextline/utils/app_colors.dart';

import '../../bloc/bloc_tickets.dart';

class TicketHistoryScroll extends StatefulWidget {
  final BlocTickets blocTickets;
  TicketHistoryScroll({Key key, this.blocTickets}) : super(key: key);

  @override
  _TicketHistoryScrollState createState() => _TicketHistoryScrollState();
}

class _TicketHistoryScrollState extends State<TicketHistoryScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: FutureBuilder(
            future: widget.blocTickets.getDataTickets(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: snapshot.data
                      .map<Widget>((Ticket ticket) => TicketRow(
                          ticket: ticket,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chat(
                                        blocTickets: widget.blocTickets,
                                        ticket: ticket,
                                      )))))
                      .toList(),
                );
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator()),
                ],
              );
            }),
      ),
    );
  }
}

Widget _ticketRow(Ticket ticket, onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
                color: AppColors.blue_dark.withOpacity(0.33),
              ),
            ]),
        child: ItemDetailHeader(
            date: ticket.fechaCreacion,
            status: ticket.mapToTicketStatusString(ticket.status),
            id: "Ticket ${ticket.id}",
            label: ticket.detalle,
            reverseLeft: true),
      ));
}
